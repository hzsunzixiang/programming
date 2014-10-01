#include"zebra.h"
#include"pqueue.h"
/* Transit Vertex */
struct ospf6_vertex
{

		/* Distance from Root (i.e. Cost) */
		int cost;
};

int ospf6_vertex_cmp (void *a, void *b)
{
		struct ospf6_vertex *va = (struct ospf6_vertex *) a;
		struct ospf6_vertex *vb = (struct ospf6_vertex *) b;
		/* ascending order */
		return (va->cost - vb->cost);
}

int main()
{

		struct ospf6_vertex *root, *v, *w,*tmp;

		struct pqueue *candidate_list;
		/* initialize */
		candidate_list = pqueue_create ();
		candidate_list->cmp = ospf6_vertex_cmp;
		root=(struct ospf6_vertex *)malloc(sizeof(struct ospf6_vertex));
		root->cost=3;
		v=(struct ospf6_vertex *)malloc(sizeof(struct ospf6_vertex));
		v->cost=6;
		w=(struct ospf6_vertex *)malloc(sizeof(struct ospf6_vertex));
		w->cost=2;
		pqueue_enqueue (root, candidate_list);
		pqueue_enqueue (v, candidate_list);
		pqueue_enqueue (w, candidate_list);
		tmp=pqueue_dequeue(candidate_list);
		printf("tmp->cost:%d\n",tmp->cost);
		tmp=pqueue_dequeue(candidate_list);
		printf("tmp->cost:%d\n",tmp->cost);

		tmp=pqueue_dequeue(candidate_list);
		printf("tmp->cost:%d\n",tmp->cost);

		return 0;
}
