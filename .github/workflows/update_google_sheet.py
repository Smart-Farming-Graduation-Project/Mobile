import os
import json
import sys
from datetime import datetime ,timedelta
from google.oauth2.service_account import Credentials
from googleapiclient.discovery import build

# Set up Google Sheets API credentials
def get_sheets_service():
    creds_dict = json.loads(os.getenv('GOOGLE_SHEETS_CREDENTIALS'))
    creds = Credentials.from_service_account_info(creds_dict, scopes=["https://www.googleapis.com/auth/spreadsheets"])
    return build('sheets', 'v4', credentials=creds)

# Function to format ISO date to "10 Oct 24"
def format_date(iso_date):
    if not iso_date or iso_date == 'N/A':
        return 'N/A'
    parsed_date = datetime.strptime(iso_date, '%Y-%m-%dT%H:%M:%SZ')
    return parsed_date.strftime('%d %b %y')


def custom_assignee(assignee):
    assignee_mapping = {
        'AliGad17611': 'Ali Gad',
        'NohaAhmedk': 'Noha',
        '00menna00': 'Menna'
    }
    return assignee_mapping.get(assignee.strip(), assignee)




# def get_default_deadline(assigned_date):
#     if assigned_date == 'N/A':
#         return 'N/A'
#     parsed_date = datetime.strptime(assigned_date, '%Y-%m-%dT%H:%M:%SZ')
#     deadline = parsed_date + timedelta(days=2)
#     return deadline.strftime('%d %b %y')




def custom_status(status):
    if status.lower() == 'open':
        return 'In Progress'
    elif status.lower() == 'closed':
        return 'Done'
    return status  


def update_google_sheet(ID, Task_Name, Assigned_Member, Assigned_Date, Date_Completed, Status, Comments):
    SPREADSHEET_ID = "17eMiDmtMaqnpfzDzzB5IQyT0rB5udHprYdDlB-W7Krw"  
    RANGE_NAME = "Mobile!A:I"  
    service = get_sheets_service()

    # Fetch current data from the sheet
    result = service.spreadsheets().values().get(spreadsheetId=SPREADSHEET_ID, range=RANGE_NAME).execute()
    values = result.get('values', [])

    # Check if the task ID already exists in the sheet
    task_row = None
    for i, row in enumerate(values):
        if len(row) > 0 and row[0] == ID:  
            task_row = i + 1  

    row_data = [
        ID,                 
        Task_Name,          
        Assigned_Member,    
        Assigned_Date,      
        Date_Completed,     
        Status,            
        Comments            
    ]

    if task_row:
     
        range_to_update = f"Mobile!A{task_row}:I{task_row}"
        body = {
            'values': [row_data]
        }
        service.spreadsheets().values().update(
            spreadsheetId=SPREADSHEET_ID, range=range_to_update,
            valueInputOption="RAW", body=body).execute()
        print(f"Task {ID} updated in row {task_row}.")
    else:
        append_range = f"Mobile!A{len(values) + 1}:I{len(values) + 1}"  # Get the next available row
        body = {
            'values': [row_data]
        }
        service.spreadsheets().values().append(
            spreadsheetId=SPREADSHEET_ID, range=append_range,
            valueInputOption="RAW", insertDataOption="INSERT_ROWS", body=body).execute()
        print(f"Task {ID} appended to the sheet.")

if __name__ == "__main__":
    if len(sys.argv) < 10:  
        print("Error: Missing arguments. Ensure all required arguments are passed.")
        sys.exit(1)

    ID = sys.argv[1]  
    Task_Name = sys.argv[2]   
    Assigned_Member = custom_assignee(sys.argv[5]) or 'Unassigned' 
    Assigned_Date = format_date(sys.argv[6]) 
    # Deadline = get_default_deadline(sys.argv[6])
    Date_Completed = format_date(sys.argv[7]) if len(sys.argv) > 7 else 'N/A'  
    Status =  custom_status(sys.argv[4])
    # Task_Quality = 5  
    repo_owner = sys.argv[8]  
    repo_name = sys.argv[9]  

    Comments = f"https://github.com/{repo_owner}/{repo_name}/issues/{ID}"

    update_google_sheet(ID, Task_Name, Assigned_Member, Assigned_Date, Date_Completed, Status, Comments)
