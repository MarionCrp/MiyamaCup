module ApplicationHelper
  def translate_enum(object, attribute)
    enum_hash = object.class::send(attribute.to_s.pluralize)
    key = enum_hash.key(object.send(attribute))

    I18n.t("activerecord.attributes.#{object.model_name.i18n_key}.#{attribute.to_s.pluralize}.#{key}")
 end
end
