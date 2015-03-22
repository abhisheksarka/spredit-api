class ResponseBuilder::BaseService
	attr_accessor :resource,
								:config
								
	def initialize(resource, config={})
		@resource = resource
		@config = config
	end

	protected

	def is_active_record_object?
		@resource.kind_of?(ActiveRecord::Base)
	end

	def is_hash_object?
		@resource.kind_of?(Hash)
	end

	def resource_has_errors?
		is_active_record_object? and !@resource.valid?
	end

	def is_collection?
		@resource.kind_of?(ActiveRecord::Relation)
	end

	def is_exception?
		@resource.kind_of?(StandardError)
	end

end