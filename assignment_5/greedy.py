# -*- coding: utf-8 -*-
"""
Created on Thu Mar 17 14:26:56 2016

@author: nitin
"""

# -*- coding: utf-8 -*-
"""
Created on Thu Mar 17 14:38:44 2016

@author: nitin
"""


# Where 0 denotes the blank tile or space.
goal_state = [0, 7, 6, 1, 4, 2, 8, 5, 3]
#



def display_board( state ):
	print "-------------"
	print "| %d | %d | %d |" % (state[0], state[3], state[6])
	print "-------------"
	print "| %d | %d | %d |" % (state[1], state[4], state[7])
	print "-------------"
	print "| %d | %d | %d |" % (state[2], state[5], state[8])
	print "-------------"
	
def move_up( state ):
	"""Moves the blank tile up on the board. Returns a new state as a list."""
	# Perform an object copy
	new_state = state[:]
	index = new_state.index( 0 )
	# Sanity check
	if index not in [0, 3, 6]:
		# Swap the values.
             temp = new_state[index - 1]
             new_state[index - 1] = new_state[index]
             new_state[index] = temp
             #display_board( state )
             return new_state
	else:
		# Can't move, return None (Pythons NULL)
		return None

def move_down( state ):
	"""Moves the blank tile down on the board. Returns a new state as a list."""
	# Perform object copy
	new_state = state[:]
	index = new_state.index( 0 )
	
	if index not in [2, 5, 8]:
		# Swap the values.
             temp = new_state[index + 1]
             new_state[index + 1] = new_state[index]
             new_state[index] = temp
             #display_board( new_state )
             return new_state
	else:
		# Can't move, return None.
		return None

def move_left( state ):
	"""Moves the blank tile left on the board. Returns a new state as a list."""
	new_state = state[:]
	index = new_state.index( 0 )
	
	if index not in [0, 1, 2]:
		# Swap the values.
             temp = new_state[index - 3]
             new_state[index - 3] = new_state[index]
             new_state[index] = temp
             #display_board( new_state )
             return new_state
	else:
		# Can't move it, return None
		return None

def move_right( state ):
	"""Moves the blank tile right on the board. Returns a new state as a list."""
	
	new_state = state[:]
	index = new_state.index( 0 )
	
	if index not in [6, 7, 8]:
		# Swap the values.
             temp = new_state[index + 3]
             new_state[index + 3] = new_state[index]
             new_state[index] = temp
             #display_board( new_state )
             return new_state
	else:
		# Can't move, return None
		return None

def create_node( state, parent, operator, depth, cost ):
	return Node( state, parent, operator, depth, cost )

def expand_node( node, nodes ):
	"""Returns a list of expanded nodes"""
	expanded_nodes = []
	expanded_nodes.append( create_node( move_up( node.state ), node, "u", node.depth + 1, 0 ) )
	expanded_nodes.append( create_node( move_down( node.state ), node, "d", node.depth + 1, 0 ) )
	expanded_nodes.append( create_node( move_left( node.state ), node, "l", node.depth + 1, 0 ) )
	expanded_nodes.append( create_node( move_right( node.state), node, "r", node.depth + 1, 0 ) )
	
	expanded_nodes = [node for node in expanded_nodes if node.state != None] #list comprehension!
	return expanded_nodes
 
 
  # Node data structure
class Node:
	def __init__( self, state, parent, operator, depth, cost ):
		# Contains the state of the node
		self.state = state
		# Contains the node that generated this node
		self.parent = parent
		# Contains the operation that generated this node from the parent
		self.operator = operator
		# Contains the depth of this node (parent.depth +1)
		self.depth = depth
		# Contains the path cost of this node from depth 0. Not used for depth/breadth first.
		self.cost = cost


def greedy(state, goal):
     	nodes = []
	nodes.append( create_node( state, None, None, 0, 0 ) )
	while True:
		
		if len( nodes ) == 0: return None
		
		nodes.sort( cmp )
		
		node = nodes.pop(0)
		
		print "Trying state", node.state, " and move: ", node.operator
		if node.state == goal:
			moves = []
			temp = node
			while True:
				moves.insert( 0, temp.operator )
				if temp.depth <=1: break
				temp = temp.parent
			return moves
		
		nodes.extend( expand_node( node, nodes ) )
		
def cmp( x, y ):
	
     x= ( h( x.state, goal_state ))
     print x 
     print "\n"
     return x

def h( state, goal ):
	
	score = 0
	for i in range( len( state ) ):
		if state[i] != goal[i]:
			score = score + 1
	return score

# Main method
def main():
	starting_state = [1, 7, 6, 0, 4, 2, 8, 5, 3]
	
	result = greedy( starting_state, goal_state )
	if result == None:
		print "No solution found"
	elif result == [None]:
		print "Start node was the goal!"
	else:
             print result
             print len(result), " moves"
             display_board(goal_state)

if __name__ == "__main__":
	main()