import matplotlib
matplotlib.use('TkAgg')
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
from sqlalchemy import create_engine

# Connect to your database
engine = create_engine("mysql+pymysql://root:4235@localhost/job_analytics_db")

# Call the stored procedure
query = query = "CALL top_paying_jobs('Software Engineer');"

df = pd.read_sql(query, engine)

# Plot
plt.figure(figsize=(12, 8))
sns.barplot(
    data=df,
    x="avg_salary",
    y="comp_name",
    palette="Blues_r"
)

# Add skills as labels on each bar
for i, row in df.iterrows():
    plt.text(
        row["avg_salary"] + 500,
        i,
        row["skills"],
        va="center",
        fontsize=8
    )

plt.title("Top 10 Companies by Avg Salary for Software Engineer")
plt.xlabel("Average Salary (USD)")
plt.ylabel("Company")
plt.tight_layout()
plt.savefig("D:/SQL_PROJECT/project_sql/SQL_PROJECT/images/top_paying_company.png", dpi=150, bbox_inches="tight")
plt.show()