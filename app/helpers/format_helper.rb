module FormatHelper
  def gender_to_display(gender)
    gender.present? ? I18n.t(".activerecord.attributes.shiai_category.genders")[ShiaiCategory.genders.key(gender).to_sym] : '-'
  end

  def week_day_to_display(day)
    day.present? ? I18n.t(".date.day_names")[day.wday] : '-'
  end
end
