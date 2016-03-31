import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;

public class DepthFS {

	String str = "120453786"; // initial state
	String goal = "123456780"; //goal state
	LinkedList <String> openList;//openlist
	Map<String,Integer> levelDepth;
	Map<String,String> stateHistory;
	int nodes = 0; //counter for node generation
	int limit = 1000; //counter for limit
	int unique = -1;
	int newValue;//counter for level depth
	int a;
	String currState;//current State
	boolean solution = false;//flag if solution is exist or not

public static void main(String args[]){
    DepthFS e = new DepthFS("120453786", "123456780");              // New Instance of the EightPuzzle
    }
DepthFS(String str,String goal){
openList = new LinkedList <String> ();
levelDepth = new HashMap<String, Integer>();
stateHistory = new HashMap<String,String>();
this.str = str;
this.goal = goal;
addToOpenList(str,null);//add root
}


void doSearch (){
	while (!openList.isEmpty()){
		currState = openList.removeFirst();//RETRIEVE then remove first node of our openlist
		if (currState.equals(goal)){ // check if current state is goal state
			solution = true;
			printSolution(currState);// print solutions
			break;
		}
		else {
//expand currentstate then add expanded node to the of openlist if not reach limit depth
//do backtrack if reach limit depth; it is basicly just not generate any more node and retrive head of openlist	
			if (levelDepth.get(currState) < limit){
				a = currState.indexOf("0");// get index position of 0 (blank)
				//left
				while (a != 0 && a != 3 && a != 6){// if blank not in the left most column then it able move left
					String nextState = currState.substring(0,a-1)+"0"+currState.charAt(a-1)+currState.substring(a+1);//swap blank with destination
					addToOpenList(nextState, currState);//add expanded node to openlist
					nodes++;
					break;
				}
				//up
				while (a!=0 && a!=1 && a!=2){//if blank not in the very top of row then it able to move up
					String nextState = currState.substring(0,a-3)+"0"+currState.substring(a-2,a)+currState.charAt(a-3)+currState.substring(a+1);//swap blank with destination
					addToOpenList(nextState, currState);//add expanded node to openlist
					nodes++; //nodes = nodes + 1; a node is being genereted add it to counter
					break;
				}
				//right
				while(a != 2 && a != 5 && a != 8){// if blank not in the right most column then it able to move right
					String nextState = currState.substring(0,a)+currState.charAt(a+1)+"0"+currState.substring(a+2);//swap blank with destination
					addToOpenList(nextState, currState);//add expanded node to openlist
					nodes++;
					break;
				}
				//down
				while (a != 6 && a != 7 && a != 8) {// if blank not in the very bottom row then it able to move down
					String nextState = currState.substring(0,a)+currState.substring(a+3,a+4)+currState.substring(a+1,a+3)+"0"+currState.substring(a+4);//swap blank with destination
					addToOpenList(nextState, currState);//add expanded node to openlist
					nodes++;
					break;
				}
			}//end if limit
		}
	}
/*	if (solution){
		System.out.println("Solution Exist");
	}
	else{
		System.out.println("Solution not yet found! My suggestion are:");
		System.out.println("1. Try to increse level depth limit ");
		System.out.println("2. Maybe it is physically impossible");
		return;
	}
	*/
	printSolution(currState);
}

private void addToOpenList (String newState, String oldState){
	if(!levelDepth.containsKey(newState)){// check repeated state
		newValue = oldState == null ? 0 : levelDepth.get(oldState) + 1;
		unique ++;
		levelDepth.put(newState, newValue);
		openList.addFirst(newState);//add node at THE BEGINNING of openlist (DepthFS Algorithm)
		stateHistory.put(newState, oldState);
		doSearch();
	}
}

void printSolution (String currState){
	if (solution){
		System.out.println("Solution found in " +levelDepth.get(currState)+" step(s)");
		System.out.println("Node generated: "+ nodes);
		System.out.println("Unique Node generated: "+ unique);
	}
	else{
		System.out.println("Solution not found!");
		System.out.println("Depth Limit Reached!");
		System.out.println("Node generated: "+ nodes);
		System.out.println("Unique Node generated: "+ unique);
	}
	String traceState = currState;
	while (traceState != null) {
		System.out.println(traceState + " at " + levelDepth.get(traceState));
		try{
			for(int z=0;z<9;z++){
				System.out.print( " " + String.valueOf(traceState.charAt(z)) + " " );
				if ((z+1) % 3 == 0){System.out.println();}
			}
		}
		catch (NullPointerException e) {}
		traceState = stateHistory.get(traceState);
	}
System.exit(0); 
//break;
}
}
