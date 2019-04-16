import json

from behave import given, then, when


@given('The {username} user exist on database')
def check_user_in_database(context, username):
    assert username == context.username


@when('The user Login')
def post_login(context):
    context.result = context.login(json.loads(context.text))


@then('The message should be showed')
def verify_received_message(context):
    assert context.result == json.loads(context.text)
