
class Post < ApplicationRecord
  # before_validation     :just_before_validation
  # before_destroy        :just_before_destroy
  # around_create         :just_around_create
  # after_create          :just_after_create
  # after_save            :just_after_save
  after_create_commit   :just_after_commit

  has_many:comments
  validates :title, presence: true, length: {minimum: 5, maximum: 30}
  validates :body, presence: true, length: {minimum: 10, maximum: 255}
  validate :postvalidator

  def postvalidator
    if title.to_s.length < 5 || body.to_s.length < 10
      self.errors[:base] << "title lenght Must be greater then 5 and body length Must greater then 10 "
    end
  end

  def self.search(search)
    if search
      where("title LIKE ?", "%#{search}%")
    end
  end

    private
      # def just_before_validation
      #   puts "+++++++++++++Befor Validation++++++++++++++"
      # end

      # def just_before_destroy
      #   puts "__________________just before destroy______________"
      # end

      # def just_around_create
      #   puts "(((((((((((((just around create)))))))))))))"
      # end

      # def just_after_create
      #   puts "!!!!!!!!!!!!!!!!just_after created!!!!!!!!!!!!!"
      # end


      # def just_after_save
      #   puts "&&&&&&&&&&&&&&&& After saving &&&&&&&&&&&&&&&"
      # end

      def just_after_commit
         puts "**************just fater commit*****************"
      end

end