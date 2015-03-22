class ResponseBuilder::MainService
	attr_accessor :resource,
								:config,
								:response
								
	def initialize(resource, config={})
		@resource = resource
		@config = config
		@response = { }
		set_response
	end

	def set_response
		@response = {
			code: ResponseBuilder::CodeService.new(resource, config).code,
			data: ResponseBuilder::DataService.new(resource, config).data,
			messages: ResponseBuilder::MessagesService.new(resource, config).messages
		}
	end

end