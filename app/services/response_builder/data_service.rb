class ResponseBuilder::DataService < ResponseBuilder::BaseService
	attr_accessor :data

	def initialize(resource, config={})
		super(resource, config)
		@data = nil
		set_data
	end

	private

	def set_data
		set_object_data
		set_collection_data
	end

	def set_collection_data
		if is_collection? or is_plain_array?
			@data = JSON.parse(ActiveModel::ArraySerializer.new(resource, each_serializer: config[:each_serializer], root: false).to_json)
		end	
	end

	def set_object_data
		return if(!is_active_record_object? && !is_hash_object?)
		r = config[:serializer] ? config[:serializer].new(resource, root: false) : resource 
		@data = JSON.parse(r.to_json)
	end
end