module RedisHelper
  def set_to_redis keys_and_values = {}, namespace = ''
    keys_and_values.each do |k, v|
      $redis.set("#{namespace}#{k}", v)
    end
  end

  def get_from_redis keys = [], namespace = ''
    keys.each do |k|
      $redis.del("#{namespace}#{k}")
    end
  end

  def delete_from_redis keys = [], namespace = ''
    keys.each do |k|
      $redis.del("#{namespace}#{k}")
    end
  end
end
