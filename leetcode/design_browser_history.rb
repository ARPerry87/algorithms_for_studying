# Leetcode link: https://leetcode.com/problems/design-browser-history/
# You have a browser of one tab where you start on the homepage and you can visit another url, get back in the history number of steps or move forward in the history number of steps.

# Implement the BrowserHistory class:

# BrowserHistory(string homepage) Initializes the object with the homepage of the browser.
# void visit(string url) Visits url from the current page. It clears up all the forward history.
# string back(int steps) Move steps back in history. If you can only return x steps in the history and steps > x, you will return only x steps. Return the current url after moving back in history at most steps.
# string forward(int steps) Move steps forward in history. If you can only forward x steps in the history and steps > x, you will forward only x steps. Return the current url after forwarding in history at most steps.

# Input:
# ["BrowserHistory","visit","visit","visit","back","back","forward","visit","forward","back","back"]
# [["leetcode.com"],["google.com"],["facebook.com"],["youtube.com"],[1],[1],[1],["linkedin.com"],[2],[2],[7]]
# Output:
# [null,null,null,null,"facebook.com","google.com","facebook.com",null,"linkedin.com","google.com","leetcode.com"]

# Explanation:
# BrowserHistory browserHistory = new BrowserHistory("leetcode.com");
# browserHistory.visit("google.com");       // You are in "leetcode.com". Visit "google.com"
# browserHistory.visit("facebook.com");     // You are in "google.com". Visit "facebook.com"
# browserHistory.visit("youtube.com");      // You are in "facebook.com". Visit "youtube.com"
# browserHistory.back(1);                   // You are in "youtube.com", move back to "facebook.com" return "facebook.com"
# browserHistory.back(1);                   // You are in "facebook.com", move back to "google.com" return "google.com"
# browserHistory.forward(1);                // You are in "google.com", move forward to "facebook.com" return "facebook.com"
# browserHistory.visit("linkedin.com");     // You are in "facebook.com". Visit "linkedin.com"
# browserHistory.forward(2);                // You are in "linkedin.com", you cannot move forward any steps.
# browserHistory.back(2);                   // You are in "linkedin.com", move back two steps to "facebook.com" then to "google.com". return "google.com"
# browserHistory.back(7);                   // You are in "google.com", you can move back only one step to "leetcode.com". return "leetcode.com"

# Plan:
# 1. We will use a stack to keep track of the history of visited URLs.
# 2. We will maintain a pointer to the current position in the history.
# 3. When visiting a new URL, we will clear the forward history.
# 4. When moving back or forward, we will update the current position accordingly.
# 5. The time complexity for each operation is O(1).
# 6. Let's implement the solution.

class BrowserHistory

  # =begin
  #     :type homepage: String
  # =end
  def initialize(homepage)
    @history = [homepage]
    @current = 0
  end
  
  
  # =begin
  #     :type url: String
  #     :rtype: Void
  # =end
  def visit(url)
    @history = @history[0..@current] + [url]
    @current += 1
  end
  
  
  # =begin
  #     :type steps: Integer
  #     :rtype: String
  # =end
  def back(steps)
    @current = [@current - steps, 0].max
    @history[@current]      
  end
  
  
  # =begin
  #     :type steps: Integer
  #     :rtype: String
  # =end
  def forward(steps)
    @current = [@current + steps, @history.length - 1].min
    @history[@current]
  end
  
  
end
  
  # Your BrowserHistory object will be instantiated and called as such:
  # obj = BrowserHistory.new(homepage)
  # obj.visit(url)
  # param_2 = obj.back(steps)
  # param_3 = obj.forward(steps)