import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
from sqlalchemy import create_engine

# Connect to your database
engine = create_engine("mysql+pymysql://root:4235@localhost/job_analytics_db")

# Run your SQL query
query = """
SELECT
    sd.skills,
    COUNT(jp.job_title_short) AS job_demand
FROM job_postings_fact jp
JOIN skills_job_dim sj ON jp.job_id = sj.job_id
JOIN skills_dim sd ON sd.skill_id = sj.skill_id
GROUP BY sd.skills
ORDER BY job_demand DESC
LIMIT 20;
"""

df = pd.read_sql(query, engine)

# Plot
plt.figure(figsize=(10, 8))
sns.barplot(data=df, x="job_demand", y="skills", hue="skills", palette="viridis", legend=False)
plt.title("Top 20 Most In-Demand Skills", fontsize=16, fontweight="bold")
plt.xlabel("Number of Job Postings", fontsize=12)
plt.ylabel("Skill", fontsize=12)
plt.tight_layout()
plt.savefig("D:/SQL_PROJECT/project_sql/SQL_PROJECT/images/skills_demand.png", dpi=150, bbox_inches="tight")
plt.show()