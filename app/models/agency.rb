class Agency < ApplicationRecord
  enum grade: [ 'Padawan', 'Jedi', 'Master' ]

  has_many :tags
  
  default_scope { order(grade: :desc) }
  
  def self.search filter_params
    if filter_params[:name].present? || filter_params[:tag].present?
      joins(:tags).where("lower(agencies.name) = ? OR lower(tags.name) = ?", filter_params[:name].downcase, filter_params[:tag].downcase).uniq
    else
      self.all
    end
  end

  def tag_list
    tags.map(&:name).join(',')
  end

  def as_json(options = {})
    super({:only => [:id, :name, :description, :grade]}.merge(methods: :tag_list))
  end
 
end

