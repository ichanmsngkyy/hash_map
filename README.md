**HashMap Overview**
----

This HashMap implementation uses a customizable load factor and capacity to manage key-value pairs efficiently.
Core Methods:
- set(key, value): Adds or updates a key-value pair.
- get(key): Retrieves the value for a given key.
- has?(key): Checks if a key exists in the map.
- remove(key): Deletes a key-value pair.
- length: Returns the number of stored keys.
- clear: Removes all entries.
- keys: Returns an array of all keys.
- values: Returns an array of all values.
- entries: Returns an array of all key-value pairs.

Features:
- Automatically resizes when the load factor is exceeded.
- Distributes entries evenly across buckets for efficiency.

Example Usage:
hash_map = HashMap.new(0.75, 16)
hash_map.set('apple', 'red')
hash_map.set('banana', 'yellow')
puts hash_map.get('apple')       # Outputs: red
puts hash_map.keys.inspect       # Outputs: ["apple", "banana"]
puts hash_map.length             # Outputs: 2



Let me know if you’d like adjustments or additional sections!
