module Inatra
  class << self
    def routes(&block)
      @buffer = {}
      instance_eval(&block)
    end

    def call(env)
      request_method = env['REQUEST_METHOD'].to_s.downcase
      path_info = env['PATH_INFO'].to_s.downcase
      @buffer[request_method][path_info] ? @buffer[request_method][path_info].call : [404, {}, 'Not Found']
    end

    def method_missing(method, *path, &block)
      if path.size == 1
        method = method.to_s.downcase
        @buffer[method] ||= {}
        @buffer[method][path[0]] = block
      else
        super
      end
    end

    def respond_to_missing?(method, *_path)
      @buffer.include?(method.to_s.downcase)
    end
  end
end
