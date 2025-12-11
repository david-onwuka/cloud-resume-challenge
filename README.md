CLOUD RESUME CHALLENGE PORTFOLIO





This repository contains my Cloud Resume Challenge project, showcasing a full serverless cloud application built on AWS. The project demonstrates real-world cloud engineering and DevOps skills using infrastructure as code (Terraform), serverless backend, and a static frontend



 LIVE SITE : https://david-cloud.com.


 

WHY I BUILT THIS


The goal of this project was to:

Learn how to build a serverless web application on AWS

Implement a real-time visitor counter with Lambda, API Gateway, and DynamoDB

Use Terraform to manage infrastructure as code

Make a website that’s secure, global, and production-ready

Have a portfolio piece that shows practical cloud skills




HOW IT WORKS



Frontend: HTML/CSS hosted on S3, served through CloudFront with HTTPS.
Backend: API Gateway triggers a Lambda function, which updates a visitor count in DynamoDB.
Infrastructure: Route 53 handles DNS, ACM handles SSL, Terraform handles everything.


 SIMPLE FLOW DIAGRAM:
 
 

User → CloudFront → S3 (frontend)

                  → API Gateway → Lambda → DynamoDB


TECH STACK:




AWS: S3, CloudFront, Lambda, DynamoDB, API Gateway, Route 53, ACM

Terraform: Infrastructure as Code

Python: Lambda function

GitHub: Version control



LAMBDA VISITOR COUNTER:




Python function that increments the visitor count:


```python
import boto3
import os

TABLE_NAME = os.environ['TABLE_NAME']
dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table(TABLE_NAME)

def lambda_handler(event, context):
    response = table.update_item(
        Key={'id': 'visitor'},
        UpdateExpression="ADD visit_count :inc",
        ExpressionAttributeValues={':inc': 1},
        ReturnValues="UPDATED_NEW"
    )
    count = response['Attributes']['visit_count']
    return {
        'statusCode': 200,
        'body': f'{{"count": {count}}}'
    }
```


ENVIRONMET VARIABLE:



TABLE_NAME = visitor-count



API URL:



https://gmijlo36qc.execute-api.us-east-1.amazonaws.com/prod/Visitor-count



 FRONTEND INTEGRATION:
 

The frontend fetches the live count from the API and updates the page:

fetch('https://gmijlo36qc.execute-api.us-east-1.amazonaws.com/prod/Visitor-count')
  .then(response => response.json())
  .then(data => {
      document.getElementById('visitorCount').textContent = data.count;
  });



 DEPLOYMENT STEPS:

 

1. Use Terraform to deploy backend and frontend infrastructure.


2. Upload frontend files to S3.


3. Lambda function updates DynamoDB whenever someone visits.


4. CloudFront serves the website globally with HTTPS.


5. Everything is version-controlled in GitHub.



 WHAT WORKS:

Real-time visitor counter.

Global delivery with HTTPS.

Fully automated with Terraform.

Ready for CI/CD integration.




NEXT STEPS:



Set up GitHub Actions to automatically deploy Terraform changes.

Add monitoring with CloudWatch dashboards and alarms.

Improve security with WAF, headers, and IAM permissions.




LINKS:


GitHub Repo: cloud-resume-challenge.

LinkedIn: https://linkedin.com/in/eme-ifeanyichukwu-2259991b2.

Email: davidonwuka21@gmail.com.
