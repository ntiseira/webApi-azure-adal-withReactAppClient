# Integrating Azure AD into a React application using interactive authentication

About this sample


Scenario

This sample demonstrates a React application calling a web API that is secured using Azure AD.

1-The React application uses the Active Directory Authentication Library (REACT ADAL) to obtain a JWT access token from Azure Active Directory (Azure AD) through the OAuth 2.0 protocol:

2-The access token is used as a bearer token to authenticate the user when calling the /Orders endpoint of the OrdersManager web API.



![alt text](https://github.com/ntiseira/webApi-azure-adal-withReactAppClient/blob/master/ReadmeFiles/flow%20app.png)



Interaction Diagram 

![alt text](https://github.com/ntiseira/webApi-azure-adal-withReactAppClient/blob/master/ReadmeFiles/OAuth%202.0%20Implicit%20Grant%20flow..png)


For more information about how the protocols work in this scenario and other scenarios, see Authentication Scenarios for Azure AD.


Once you've started the OrdersApi, you can run the React application, and then view items in the order list. 


React Application

![alt text](https://github.com/ntiseira/webApi-azure-adal-withReactAppClient/blob/master/ReadmeFiles/reactApp.jpg)


Web api

![alt text](https://github.com/ntiseira/webApi-azure-adal-withReactAppClient/blob/master/ReadmeFiles/webApi.jpg)


How to run this sample
To run this sample, you'll need:

*Visual Studio 2017
*Sql express 2017
*NodeJs
*An Internet connection
*An Azure Active Directory (Azure AD) tenant. For more information on how to get an Azure AD tenant, see How to get an Azure AD tenant (link azure ad https://docs.microsoft.com/es-es/azure/active-directory/develop/quickstart-create-new-tenant)
*A user account in your Azure AD tenant. This sample will not work with a Microsoft account (formerly Windows Live account). Therefore, if you signed in to the Azure portal with a Microsoft account and have never created a user account in your directory before, you need to do that now.



Step 1: Clone or download this repository

git clone https://github.com/ntiseira/webApi-azure-adal-withReactAppClient.git


Step 2: Register the sample with your Azure Active Directory tenant

There are two projects in this sample. Each needs to be separately registered in your Azure AD tenant. 

First step: choose the Azure AD tenant where you want to create your applications

As a first step you'll need to:

*Sign in to the Azure portal.
*On the top bar, click on your account, and then on Switch Directory.
*Once the Directory + subscription pane opens, choose the Active Directory tenant where you wish to register your application, from the Favorites or All Directories list.
Click on All services in the left-hand nav, and choose Azure Active Directory.


Note
In the next steps, you might need the tenant name (or directory name) or the tenant ID (or directory ID). These are presented in the Properties of the Azure Active Directory window respectively as Name and Directory ID


Register the service app (OrdersManager)

*In the Azure Active Directory pane, click on App registrations and choose New application registration.
*Enter a friendly name for the application, for example 'OrdersApi' and select 'Web app / API' as the Application Type.
*For the Sign-on URL, enter the base URL for the sample. By default, this sample uses http://localhost:51590/.
*Click Create to create the application.
In the succeeding page, Find the Application ID value and record it for later. You'll need it to configure the Visual Studio configuration file for this project.
Then click on Settings, and choose Properties.
*For the App ID URI, replace the guid in the generated URI 'http://<your_tenant_name>/<guid>', with the name of your service, for example, 'http://<your_tenant_name>/OrdersApi' (replacing <your_tenant_name> with the name of your Azure AD tenant)



Register the client React app (OrdersReact)

*In the Azure Active Directory pane, click on App registrations and choose New application registration.
*Enter a friendly name for the application, for example 'OrdersReact' and select 'Native' as the Application Type.
*For the Redirect URI, enter https://<your_tenant_name>/OrdersReact, replacing <your_tenant_name> with the name of your Azure AD tenant.
*Click Create to create the application.
*In the succeeding page, Find the Application ID value and record it for later. You'll need it to configure the Visual Studio configuration file for this project.
*Then click on Settings, and choose Properties.
*Configure Permissions for your application. To that extent, in the Settings menu, choose the 'Required permissions' section and then, click on Add, then Select an API, and type OrdersApi in the textbox. Then, click on Select Permissions and select Access 'OrdersApi'.


Step 3: Configure the sample to use your Azure AD tenant


In the steps below, "ClientID" is the same as "Application ID" or "AppId".

Open the solution in Visual Studio to configure the web api project.

Configure the service project

Open the TodoListService\Web.Config file
Find the app key ida:Tenant and replace the existing value with your Azure AD tenant name.
Find the app key ida:Audience and replace the existing value with the App ID URI you registered earlier for the TodoListService-NativeDotNet app. For instance use https://<your_tenant_name>/TodoListService-NativeDotNet, where <your_tenant_name> is the name of your Azure AD tenant.

Open some text editor and to configure the react app project

Configure the client project

Open the FE\src\AdalReact\adalConfig.js file
Find the property key instance and replace the existing value with https://login.microsoftonline.com/.
Find the property key ida:Tenant and replace the existing value with your Azure AD tenant name.
Find the property key ida:ClientId and replace the existing value with the application ID (clientId) of the OrdersReact application copied from the Azure portal.

Step 4: Run the sample

Web api
Clean the solution, rebuild the solution, and run it. You might want to go into the solution properties and set both projects as startup projects, with the service project starting first.

React app

*Open windows command line, or node console
*cd FE\
npm install
npm start



Community Help and Support
Use Stack Overflow to get support from the community. Ask your questions on Stack Overflow first and browse existing issues to see if someone has asked your question before. Make sure that your questions or comments are tagged with [adal dotnet].

If you find a bug in the sample, please raise the issue on GitHub Issues.

To provide a recommendation, visit the following User Voice page.

Contributing
If you'd like to contribute to this sample, see CONTRIBUTING.MD.

This project has adopted the Microsoft Open Source Code of Conduct. For more information, see the Code of Conduct FAQ or contact opencode@microsoft.com with any additional questions or comments.


More information
For more information, see ADAL.NET's conceptual documentation:

Recommended pattern to acquire a token
Acquiring tokens interactively in public client applications
Customizing Token cache serialization
For more information about how OAuth 2.0 protocols work in this scenario and other scenarios, see Authentication Scenarios for Azure AD.








