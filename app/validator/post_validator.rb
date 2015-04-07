class PostValidator < ActiveModel::Validator
  def validate(record)
    if record.title.blank? and record.content.blank? and record.postable.blank?
      record.errors[:post_invalid] << I18n.t("api_response.code_1400") 
    end
  end
end
