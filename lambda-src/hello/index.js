const AWS = require('aws-sdk');
const dynamo = new AWS.DynamoDB.DocumentClient();
const TABLE = process.env.TABLE_NAME || "demo-table";

exports.handler = async (event) => {
  const id = Date.now().toString();
  try {
    await dynamo.put({
      TableName: TABLE,
      Item: { id, message: "hello from lambda", ts: id }
    }).promise();

    const r = await dynamo.scan({ TableName: TABLE, Limit: 10 }).promise();

    return {
      statusCode: 200,
      body: JSON.stringify({ ok: true, items: r.Items }),
      headers: { "Content-Type": "application/json" }
    };
  } catch (err) {
    console.error("error", err);
    return { statusCode: 500, body: JSON.stringify({ ok: false, error: err.message }) };
  }
};
