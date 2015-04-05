class ResponseBuilder::MainService
	attr_accessor :resource,
								:config,
								:response,
								:params
								
	def initialize(resource, config={}, params={})
		@resource = resource
		@config = config
		@response = { }
		@params = params
		set_response
	end

	def set_response
		@response = {
			api: true,
			code: ResponseBuilder::CodeService.new(resource, config).code,
			body: ResponseBuilder::DataService.new(resource, config).data,
			messages: ResponseBuilder::MessagesService.new(resource, config).messages,
			meta: params[:meta]
		}
	end

end