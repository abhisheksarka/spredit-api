class PostValidator < ActiveModel::Validator
  def validate(record)
    if content_absent?(record) and record.postable.blank?
      record.errors[:post_invalid] << I18n.t("api_response.code_1400") 
    end
  end

  private

  def content_absent?(r)
    r.content.blank?
  end
end
