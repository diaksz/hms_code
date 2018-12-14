# Setup
from __future__ import print_function
from googleapiclient.discovery import build
from httplib2 import Http
from oauth2client import file, client, tools

SCOPES = 'https://www.googleapis.com/auth/spreadsheets'
ID = '1S5GL9K8sEug3PJrF4eP3iPDo-Ynhujh3MwkrA0xpSYI'
cb2_ID = '1Vv5QM7ry3ohXex3OTMWvYt1vT9ljsmjaq-Ns0n1GgXg'
RANGE = 'test!A1:E100'
PPC_RANGE = 'test_sheet!A1:A4'
cb2_range = 'Align 500+!A1:A675'

store = file.Storage('token.json')
creds = store.get()
#if not creds or creds.invalid:
    #flow = client.flow_from_clientsecrets('credentials.json',SCOPES)
    #creds = tools.run_flow(flow,store)
service = build('sheets','v4',http=creds.authorize(Http()))

sheet = service.spreadsheets()
# Functions 
def write_rows(Id,Sheet,Start,values):
    
    Range = '%s!%s'%(Sheet,Start)
    value_range_body = {
        "values": [
        values
    ],
    "majorDimension": 'ROWS'
        }
    request = service.spreadsheets().values().update(spreadsheetId=Id,range=Range,valueInputOption='RAW',body=value_range_body,
           includeValuesInResponse=True,
           responseDateTimeRenderOption='FORMATTED_STRING',
           responseValueRenderOption='FORMATTED_VALUE')
    response = request.execute()
    return response

def write_cols(Id,Sheet,Start,values):
    
    Range = '%s!%s'%(Sheet,Start)
    value_range_body = {
        "values": [
        values
    ],
    "majorDimension": 'COLUMNS'
        }
    request = service.spreadsheets().values().
    update(spreadsheetId=Id, range=Range,
           valueInputOption='RAW',
           body=value_range_body,
           includeValuesInResponse=True,
           responseDateTimeRenderOption='FORMATTED_STRING',
           responseValueRenderOption='FORMATTED_VALUE',
           response = request.execute()
    return response
           
def read_cell_value(Id,Sheet,start,end):
    Range = '%s!%s:%s'%(Sheet,start,end)
    result = sheet.values().get(spreadsheetId=Id,range=Range).execute()
    values = result.get('values',[])
    return values
def get_rgb(Id,Range,offset):
    data = service.spreadsheets().get(spreadsheetId=Id,
                                   ranges=Range,
                                   includeGridData=True
                                 ).execute()
    sections = data['sheets'][0]['data'][0]['rowData']
    rgblst = []
    for i in range(0,len(sections)):
        y = i + offset
        x = sections[i]['values'][0]['effectiveFormat']['backgroundColor']
        
        if x == {u'red': 1}:
            x = "Bad"
        elif x == {u'blue': 0.65882355, u'green': 0.84313726, u'red': 0.7137255}:
            x = "Done"
        elif x == {u'blue': 1, u'green': 1,u'red': 1}:
            x = 'Skip/blown/to do'
        elif x == {u'blue': 0.827451, u'green': 0.91764706, u'red': 0.8509804}:
            x = 'Running'
        rgblst.append((y,x))
    return rgblst

