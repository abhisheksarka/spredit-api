class ResponseBuilder::MessagesService < ResponseBuilder::BaseService
	attr_accessor :messages

	def initialize(resource, config={})
		super(resource, config)
		@messages = { }
		set_messages
	end

	private

	def set_messages
		@messages = resource.errors.messages if resource_has_errors?
		@messages = resource.messages if is_exception? 	
	end
	
end