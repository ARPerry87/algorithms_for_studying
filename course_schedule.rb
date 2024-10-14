# Leetcode link: https://leetcode.com/problems/course-schedule/
# Description: There are a total of numCourses courses you have to take, labeled from 0 to numCourses-1. Some courses may have prerequisites, for example to take course 0 you have to first take course 1, which is expressed as a pair: [0,1]. Given the total number of courses and a list of prerequisite pairs, is it possible for you to finish all courses?

# Solution:

# we want to create an adjacency list to store the prerequisites
# and use dfs to solve this problem

def can_finish(num_courses, prerequisites)
  # Initialize a hash with default values as empty arrays
  pre_map = Hash.new { |hash, key| hash[key] = [] }

  # Ensure all course indices are present in the hash
  (0...num_courses).each { |i| pre_map[i] }

  # Populate the hash with the prerequisites
  # The key is the course and the value is the prerequisite
  # We want to store the prerequisites in an array
  
  prerequisites.each do |crs, pre|
    pre_map[crs] << pre
  end
  visit_set = Set.new

  dfs = lambda do |crs|
    if visit_set.include?(crs)
      return false
    end
    if pre_map[crs].empty?
      return true
    end
    visit_set.add(crs)
    pre_map[crs].each do |p|
      return false if !dfs.call(p)
    end
    visit_set.delete(crs) # we want to remove the course from the set
    pre_map[crs] = [] # we want to set the prerequisites to an empty array
    return true
  end

  for i in 0...num_courses
    return false if !dfs.call(i)
  end
  return true
end

# or using a nested function 


def can_finish(num_courses, prerequisites)
  # Initialize a hash with default values as empty arrays
  pre_map = Hash.new { |hash, key| hash[key] = [] }

  # Ensure all course indices are present in the hash
  (0...num_courses).each { |i| pre_map[i] }

  # Populate the hash with the prerequisites
  # The key is the course and the value is the prerequisite
  # We want to store the prerequisites in an array
  prerequisites.each do |crs, pre|
    pre_map[crs] << pre
  end

  visit_set = Set.new

  def dfs(crs, pre_map, visit_set)
    if visit_set.include?(crs)
      return false
    end
    if pre_map[crs].empty?
      return true
    end
    visit_set.add(crs)
    pre_map[crs].each do |p|
      return false if !dfs(p, pre_map, visit_set)
    end
    visit_set.delete(crs) # we want to remove the course from the set
    pre_map[crs] = [] # we want to set the prerequisites to an empty array
    return true
  end

  for i in 0...num_courses
    return false if !dfs(i, pre_map, visit_set)
  end
  return true
end

# or using a queue

def can_finish(num_courses, prerequisites)
  in_degree = Array.new(num_courses, 0) # we want to create an array of the same size as the number of courses and set all the values to 0
  adj_list = Hash.new{ |h, k| h[k] = [] } # we want to create a hash with default values as empty arrays

  for pre, course in prerequisites do
    in_degree[pre] += 1 # we want to increment the value at the index of the prerequisite
    adj_list[course] << pre # we want to add the prerequisite to the course
  end

  queue = Queue.new
  res = []

  for i in (0...num_courses) do
    queue << i if in_degree[i] == 0
  end

  while !queue.empty? do
    node = queue.pop
    res << node
    neighbors = adj_list[node]
    for nei in neighbors do
    in_degree[nei] -= 1
    queue << nei if in_degree[nei] == 0
    end
  end
  return res.length == num_courses
end
