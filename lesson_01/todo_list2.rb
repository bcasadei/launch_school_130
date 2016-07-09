require 'pry'
# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.
class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.
class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    # add item to @todos, crosscheck for items that are not ToDo objects
    raise TypeError, 'Can only add Todo objects' if todo.class != Todo
    @todos.push(todo)
  end
  alias_method :<<, :add

  def <<(todo)
    add(todo)
  end

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def item_at(idx)
    @todos.fetch(idx)
  end

  def mark_done_at(idx)
    item_at(idx).done!
  end

  def mark_undone_at(idx)
    item_at(idx).undone!
  end

  def done!
    @todos.each_index do |idx|
      mark_done_at(idx)
    end
  end

  def done?
    @todos.all? { |todo| todo.done? }
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def remove_at(idx)
    @todos.delete(item_at(idx))
  end

  def to_s
    puts "---- #{title} ----"
    @todos.each { |obj| puts "#{obj.to_s}" }
  end

  def each
    @todos.each { |obj| yield(obj) }
    self
  end

  def select
    list = TodoList.new(title)
    each do |obj| 
      list.add(obj) if yield(obj)
    end
    list
  end

  def find_by_title(str)
    @todos.select { |todo| todo.title == str }.first
  end

  def all_done
    @todos.select { |todo| todo.done? }
  end

  def all_not_done
    @todos.select { |todo| todo.done? == false }
  end

  def mark_done(str)
    find_by_title(title) && find_by_title(title).done!
  end

  def mark_all_done
    @todos.each { |todo| todo.done! }
  end

  def mark_all_undone
    @todos.each { |todo| todo.undone! }
  end
end

# given
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
todo4 = Todo.new("Buy milk")
list = TodoList.new("Today's Todos")

# ---- Adding to the list -----

# add
list.add(todo1)               # adds todo1 to end of list, returns list
list.add(todo2)                 # adds todo2 to end of list, returns list
list.add(todo3)                 # adds todo3 to end of list, returns list
list.add(todo4)
# list.add(1)                     # raises TypeError with message "Can only add Todo objects"

# <<
# same behavior as add

# ---- Interrogating the list -----

# size
# list.size                       # returns 3

# first
# list.first                      # returns todo1, which is the first item in the list

# # last
# list.last                       # returns todo3, which is the last item in the list

# ---- Retrieving an item in the list ----

# item_at
# list.item_at                    # raises ArgumentError
# list.item_at(1)                 # returns 2nd item in list (zero based index)
# list.item_at(100)               # raises IndexError

# ---- Marking items in the list -----

# mark_done_at
# list.mark_done_at               # raises ArgumentError
# list.mark_done_at(1)            # marks the 2nd item as done
# list.mark_done_at(0) 
# list.mark_done_at(100)          # raises IndexError

# # mark_undone_at
# list.mark_undone_at             # raises ArgumentError
# list.mark_undone_at(1)          # marks the 2nd item as not done,
# list.mark_undone_at(100)        # raises IndexError

# ---- Deleting from the the list -----

# shift
# list.shift                      # removes and returns the first item in list

# pop
# list.pop                        # removes and returns the last item in list

# remove_at
# list.remove_at                  # raises ArgumentError
# list.remove_at(1)               # removes and returns the 2nd item
# list.remove_at(100)             # raises IndexError

# ---- Outputting the list -----

# to_s
# list.to_s                      # returns string representation of the list

# ---- Today's Todos ----
# [ ] Buy milk
# [ ] Clean room
# [ ] Go to gym

# or, if any todos are done

# ---- Today's Todos ----
# [ ] Buy milk
# [X] Clean room
# [ ] Go to gym

# ---- each method ----
# results = list.each do |todo|
#   puts todo                   # calls Todo#to_s
# end
# puts results.inspect

# ---- select method ----
# results = list.select { |todo| todo.done? }
# puts results.inspect

# p list.find_by_title("Buy")

# p list.all_done

# p list.all_not_done

list.mark_done("Buy milk")
list.to_s

# list.mark_all_done
# list.to_s

# list.mark_all_undone
# list.to_s

