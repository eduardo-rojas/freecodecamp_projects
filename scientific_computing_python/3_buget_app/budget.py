# Category class that handles different budget items
class Category:
    # Constructor
    def __init__(self, name):
        self.name = name 
        self.ledger = list()
    # Deposit method - adds a deposit dictionary to the 'ledger' 
    def deposit(self, amount, description=""):
        deposit_item = {"amount": amount, "description": description}
        self.ledger.append(deposit_item)
    # Auxiliary method to verify if the 'ledger' has the necessary funds
    def check_funds(self, amount):
        total_amount = 0
        for ledger_item in self.ledger:
            print(ledger_item)
            total_amount += ledger_item['amount']
        sufficient_funds = False if amount > total_amount else True
        return sufficient_funds 
    # Withdraw method - Includes a given amount (in negative number format) to the 'ledger'
    def withdraw(self, amount, description=""):
        if self.check_funds(amount):
            withdraw_operation = {"amount": -1 * amount, "description": description}
            self.ledger.append(withdraw_operation)
            return True 
        return False
    # get_balance method - Provides the total balance of the 'ledger'
    def get_balance(self):
        total_amount = 0
        for ledger_item in self.ledger:
            total_amount += ledger_item['amount']
        return total_amount
    # transfer method - transfers a given amount to another budget category
    def transfer(self, amount, budget_category):
        if self.check_funds(amount):
            self.withdraw(amount, f"Transfer to {budget_category.name}")
            budget_category.deposit(amount, f"Transfer from {self.name}")
            return True
        return False
    # String method - Returns required string format 
    def __str__(self):
        top = self.name.center(30, "*")
        body = ""
        total = "Total: " + str(round(self.get_balance(), 2))
        for item in self.ledger:
            current_amount = str(round(item["amount"], 2))
            current_description = item["description"]
            if len(current_amount) > 7:
                current_amount = current_amount[0:7]
            if len(current_description) > 23:
                current_description = current_description[0:23] 
            body += "{description_item:<23}".format(description_item=current_description)
            body += "{amount_item:>30}\n".format(amount_item=current_amount)
        return f"{top}\n{body}{total}"






def create_spend_chart(categories):
    total_spent = 0
    
    spending_by_category = {}
    for category in categories:
        category_spent = 0
        for item in category.ledger:
            if item["amount"] < 0 :
                total_spent += item["amount"] * -1
                category_spent += item["amount"] * -1
        spending_by_category.update({f"{category.name}": category_spent})
    for key, value in spending_by_category.items():
        spending_by_category[key] = round((value * 100) / total_spent, 2)
    # Data presentation layer - Preparing the bar char output:
    bar_chart_title = "Percentage spent by category\n"
    percentage_list = list(range(100, -1, -10))
    bar_chart_rows = ""
    for i in  percentage_list:
        for value in list(spending_by_category.values()):
            if round(value, -1) == i :
                 bar_chart_rows += f"{i}| o        \n"
            else:
                bar_chart_rows += f"{i}|          \n"
    bar_chart_rows += "    ----------\n"

    bar_chart = f"{bar_chart_title}{bar_chart_rows}"

    #return total_spent, spending_by_category.values()
    return bar_chart

