import ipdb


def login(payload):
    if len(payload) == 0:
        return {
            "username": ["missing data"],
            "password": ["missing data"]
        }

    if not "username" in payload.keys():
        return {"username": ["missing data"]}

    if not "password" in payload.keys():
        return {"password": ["missing data"]}

    return {"message": "success"}


def before_feature(context, feature):
    context.username = "admin"
    context.login = login


def after_step(context, step):
    if step.status == "failed":
        ipdb.spost_mortem(step.exc_traceback)
