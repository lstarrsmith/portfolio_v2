class Image < ActiveRecord::Base
	belongs_to :category

	has_attached_file :photo, :styles => { :thumb => "100x100", :medium => "300x300", :large => "600x600"},
		:url => "loganportfolio.s3.amazonaws.com",
		:path => '/:class/:attachment/:id_partition/:style/:filename',
		# http://stackoverflow.com/questions/7897710/is-it-possible-to-configure-paperclip-to-produce-https-urls
		:s3_protocol => :https

		# :path => ":rails_root/public/assets/images/:id/:filename",
		# :url => "/assets/images/:id/:filename"

	validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end
