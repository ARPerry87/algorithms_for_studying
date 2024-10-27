# Leetcode link: https://leetcode.com/problems/first-bad-version/
# You are a product manager and and currently leading a team to develop a new product. Unfortunately, the latest version of your product fails the quality check. Since each version is developed based on the previous version, all the versions after a bad version are also bad.

# Suppose you have n versions [1, 2, ..., n] and you want to find out the first bad one, which causes all the following ones to be bad.

# You are given an API bool isBadVersion(version) which returns whether version is bad. Implement a function to find the first bad version. You should minimize the number of calls to the API.

# Example 1:
# Input: n = 5, bad = 4
# Output: 4
# Explanation:
# call isBadVersion(3) -> false
# call isBadVersion(5) -> true
# call isBadVersion(4) -> true
# Then 4 is the first bad version.

# The is_bad_version API is already defined for you.
# @param {Integer} version
# @return {boolean} whether the version is bad
# def is_bad_version(version):

# @param {Integer} n
# @return {Integer}

def first_bad_version(n)
  l, r = 0, n

  while l < r
    mid = l + (r - l) / 2 
    if is_bad_version(mid)
      r = mid # if mid is bad, search in the left half
    else
      l = mid + 1 # if mid is good, search in the right half
    end
  end

  l # l will be the first bad version
end

# The time complexity of this solution is O(log n) due to the binary search approach. The space complexity is O(1) since we are using a constant amount of space.