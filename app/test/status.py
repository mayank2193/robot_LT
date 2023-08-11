import os
from robot.libraries.BuiltIn import BuiltIn
from robot.libraries.BuiltIn import _Misc
import robot.api.logger as logger
from robot.api.deco import keyword

@keyword("TEST STATUS")
def report_lambdatest_status(status):
    selenium = BuiltIn().get_library_instance('SeleniumLibrary')

    # Mark test status pass/failed
    lambda_status = "passed"  if status=="PASS" else "failed"
    lambda_status_script = 'lambda-status={}'.format(lambda_status)
    selenium.execute_javascript(lambda_status_script)
    