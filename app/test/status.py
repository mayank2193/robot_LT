import os
from robot.libraries.BuiltIn import BuiltIn
from robot.libraries.BuiltIn import _Misc
import robot.api.logger as logger
from robot.api.deco import keyword
from SeleniumLibrary import SeleniumLibrary
from AppiumLibrary import AppiumLibrary
# @keyword("TEST STATUS")
# def report_lambdatest_status(status):
#     selenium = BuiltIn().get_library_instance('AppiumLibrary')
     # Mark test status pass/failed
#     lambda_status = "passed"  if status=="PASS" else "failed"
#     lambda_status_script = 'lambda-status={}'.format(lambda_status)
#     selenium.execute_script(lambda_status_script)

class status(object):
    ROBOT_LIBRARY_SCOPE = 'GLOBAL'
    def lambda_Status(self,tStatus):
        if tStatus == "PASS":
            
            selenium = BuiltIn().get_library_instance('AppiumLibrary')
            selenium.execute_script("lambda-status=passed")
        else:
            
            selenium = BuiltIn().get_library_instance('AppiumLibrary')
            selenium.execute_script("lambda-status=failed")
        return