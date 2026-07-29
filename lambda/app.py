import json
import boto3
import os
import uuid

dynamodb = boto3.resource("dynamodb")

table = dynamodb.Table(os.environ["TABLE_NAME"])


def lambda_handler(event, context):

    method = event.get("requestContext", {}).get("http", {}).get("method")

    if method == "GET":

        response = table.scan()

        return {
            "statusCode": 200,
            "body": json.dumps(response["Items"])
        }

    elif method == "POST":

        body = json.loads(event["body"])

        employee = {

            "employeeId": str(uuid.uuid4()),
            "name": body["name"],
            "department": body["department"],
            "salary": body["salary"]

        }

        table.put_item(Item=employee)

        return {

            "statusCode": 201,
            "body": json.dumps(employee)

        }

    return {

        "statusCode": 200,
        "body": "Employee API Working"

    }