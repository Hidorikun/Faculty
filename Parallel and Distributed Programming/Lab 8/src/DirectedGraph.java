import java.util.ArrayList;
import java.util.List;

public class DirectedGraph {
    private List<List<Integer>> container;
    private List<Integer> nodes;

    public DirectedGraph(int nodeCount) {
        this.container = new ArrayList<>(nodeCount);
        this.nodes = new ArrayList<>();

        for (int i = 0; i < nodeCount; i++) {
            this.container.add(new ArrayList<>());
            this.nodes.add(i);
        }
    }

    public void addEdge(int nodeA, int nodeB) {
        this.container.get(nodeA).add(nodeB);
    }

    public List<Integer> neighboursOf(int node) {
        return this.container.get(node);
    }

    public List<Integer> getNodes(){
       return nodes;
    }

    public int size() {
        return this.container.size();
    }

}
