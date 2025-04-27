# frozen_string_literal: true

# This class implements a hash map data structure.
# It provides methods for storing, retrieving, and managing key-value pairs.
class HashMap
  attr_accessor :load_factor, :capacity

  def initialize(load_factor, capacity)
    @load_factor = load_factor
    @capacity = capacity
    @buckets = Array.new(@capacity)
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
    hash_code % @capacity
  end

  def bucket_key(key)
    index = hash(key)
    @buckets[index] ||= []
    @buckets[index]
  end

  def set(key, value)
    return if key.nil?

    bucket = bucket_key(key)

    bucket.each do |entry|
      if entry[:key] == key
        entry[:value] = value
        return
      end
    end
    bucket << { key: key, value: value }
  end

  def get(key)
    return nil if key.nil?

    bucket = bucket_key(key)
    bucket.each do |entry|
      return entry[:value] if entry[:key] == key
    end
    nil
  end

  def has?(key)
    return false if key.nil?

    bucket = bucket_key(key)

    bucket.each do |entry|
      return true if entry[:key] == key
    end
    false
  end

  def remove(key)
    return nil if key.nil?

    bucket = bucket_key(key)

    bucket.each_with_index do |entry, index|
      if entry[:key] == key
        bucket.delete_at(index)
        return true
      end
    end
    false
  end

  def length
    count = 0
    @buckets.each do |bucket|
      count += bucket.size if bucket
    end
    count
  end

  def clear
    @buckets = Array.new(@capacity)
  end

  def keys
    all_keys = []

    @buckets.each do |bucket|
      next if bucket.nil?

      bucket.each do |entry|
        all_keys << entry[:key]
      end
    end
    all_keys
  end

  def values
    all_values = []

    @buckets.each do |bucket|
      next if bucket.nil?

      bucket.each do |entry|
        all_values << entry[:value]
      end
    end
    all_values
  end

  def entries
    all_entries = []

    @buckets.each do |bucket|
      next if bucket.nil?

      bucket.each do |entry|
        all_entries << `[[#{entry[:key]}], [#{entry[:value]}]`
      end
    end
    all_entries
  end
end
