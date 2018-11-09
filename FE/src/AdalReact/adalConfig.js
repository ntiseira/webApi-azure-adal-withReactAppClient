import { AuthenticationContext, adalFetch, withAdalLogin, adalGetToken } from 'react-adal';

// Endpoint URL
export const endpoint = 'https://NICOLASTISEIRAhotmail.onmicrosoft.com/OrdersApi';


export const adalConfig = {
  instance: 'https://login.microsoftonline.com/',
tenant: '5d887015-fb2b-4ffe-a21e-28202b88889a',
clientId: '2e5bfb38-bd69-4f2b-8f0e-75c5761f047a',
postLogoutRedirectUri: window.location.origin,
  cacheLocation: 'localStorage',

  endpoints: {
    api:endpoint
}
};

export const authContext = new AuthenticationContext(adalConfig);

export const adalApiFetch = (fetch, url, options) =>
  adalFetch(authContext, adalConfig.endpoints.api, fetch, url, options);

export const withAdalLoginApi = withAdalLogin(authContext, adalConfig.endpoints.api);

export const adalGetTokenApp= (fetch, url, options) =>
    adalGetToken(this.authContext, endpoint);

