if Rails.env.staging? || Rails.env.production?
	$redis = Redis.new(:host => 'localhost', :port => 6379, :db => 3)
else
	# database number
	$redis = Redis.new(:host => 'localhost', :port => 6379, :db => 3)
end
