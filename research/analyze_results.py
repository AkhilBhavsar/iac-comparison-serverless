import pandas as pd
import matplotlib.pyplot as plt
import os

fn = "research/results.csv"
if not os.path.exists(fn):
    print("No results.csv found. Run experiments and collect CSV at research/results.csv")
else:
    df = pd.read_csv(fn)
    # average duration by tool and action
    agg = df.groupby(['tool','action'])['duration_seconds'].mean().reset_index()
    for action in agg['action'].unique():
        sub = agg[agg['action']==action]
        plt.figure()
        plt.bar(sub['tool'], sub['duration_seconds'])
        plt.title(f'Average duration for {action}')
        plt.ylabel('seconds')
        out = f"research/plot_{action}.png"
        plt.savefig(out)
        print("Saved plot:", out)
