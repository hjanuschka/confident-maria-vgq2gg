#include <bits/stdc++.h>
using namespace std;

#define fr first
#define se second
#define pb push_back
#define ll long long

const int SIZE = 1000*1000+100;


vector<int > adj[SIZE], adj_rev[SIZE],adj_scc[SIZE],adj_sccrev[SIZE];
vector<bool> used,israble;
vector<int> order, component,roots;

long long sum[SIZE],fun[SIZE],N,S,E,M;

void dfs1(int v) {
    used[v] = true;

    for (auto u : adj[v])
        if (!used[u])
            dfs1(u);

    order.push_back(v);
}

void dfs2(int v) {
    used[v] = true;
    component.push_back(v);

    for (auto u : adj_rev[v])
        if (!used[u])
            dfs2(u);
}


void dfs3(int src,int f)
{
    israble[src]=1;
    for(auto x : adj_scc[src])if(x!=f && israble[x]==0)
    {
        dfs3(x,src);
    }
}

long long dfs4(int src,int f)
{
    long long ret = 0;
    for(auto x : adj_sccrev[src])if(x!=f && israble[x])
    {
        ret = max(ret, dfs4(x,src));
    }
    return ret + sum[src];
}



int main() {
    cin >> N >> M >> S >> E;
    for(int i = 0;i<N;i++)cin >> fun[i];
    --S;--E;
    roots.resize(N);
    israble.resize(N);
    for (int i = 1;i<=M;i++ ) {
        int a, b;
        cin >> a >> b;
        --a,--b;
        adj[a].push_back(b);
        adj_rev[b].push_back(a);
    }

    used.assign(N, false);

    for (int i = 0; i < N; i++)
        if (!used[i])
            dfs1(i);

    used.assign(N, false);
    reverse(order.begin(), order.end());

    for (auto v : order)
        if (!used[v]) {
            dfs2 (v);

            for (auto u : component) {roots[u] = v;sum[v]+=fun[u];}

            component.clear();
        }
    for(int i = 0;i<SIZE;i++)
    {
        for(auto x : adj[i])
        {
            if(roots[x]!=roots[i]){
                adj_scc[roots[i]].pb(roots[x]);
                adj_sccrev[roots[x]].pb(roots[i]);

            }
        }
    }
    dfs3(roots[S],-1);
    long long  ans = dfs4(roots[E],-1);
    cout<<ans<<'\n';
}


