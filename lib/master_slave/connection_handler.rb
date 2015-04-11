module MasterSlave
  class ConnectionHandler

    class ArProxy
      attr_reader :name

      def initialize(name)
        @name = name
      end
    end

    class << self
      def connection_pool_name(slave_name)
        "master_slave_#{slave_name.to_s.strip}"
      end

      def setup_connection(load_version = nil)
        ActiveRecord::Base.slave_connection_names ||= []

        MasterSlave.config.slave_names.each do |slave_name|
          slave_name = slave_name.to_s.strip
          slave_config = MasterSlave.config.slave_config(slave_name)
          slave_name = "#{slave_name}_#{load_version}"

          if load_version && !slave_config['database'].end_with?(load_version.to_s)
            db = "#{slave_config['database']}"
            db = db.gsub(/\d+/, "")}
            db = db + "_#{load_version}"
            db = db.gsub("__", "_")

            unless MasterSlave.quiet
              puts "\033[32mload_version = #{load_version}, spec=#{db}\033[0m"
            end

            slave_config['database'] = db
          end

          if !ActiveRecord::Base.slave_connection_names.include?(slave_name)
            ActiveRecord::Base.slave_connection_names << slave_name
          end

          spec = { Rails.env => slave_config }
          resolver = ActiveRecord::ConnectionAdapters::ConnectionSpecification::Resolver.new spec
          spec = resolver.spec(Rails.env.to_sym)

          unless ActiveRecord::Base.respond_to?(spec.adapter_method)
            raise AdapterNotFound, "database configuration specifies nonexistent #{spec.config[:adapter]} adapter"
          end

          ar_proxy = ArProxy.new(connection_pool_name(slave_name))
          ActiveRecord::Base.remove_connection(ar_proxy)
          ActiveRecord::Base.connection_handler.establish_connection ar_proxy, spec
        end
      end
    end
  end
end
