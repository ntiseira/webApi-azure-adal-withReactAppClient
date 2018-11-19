import { AuthenticationContext, adalFetch, withAdalLogin, adalGetToken } from 'react-adal';

// Endpoint URL
export const endpoint = 'https://ntiseirahotmail.onmicrosoft.com/OrdersApi';


export const adalConfig = {
  instance: 'https://login.microsoftonline.com/',
tenant: 'dac31651-9c13-49b9-b8aa-fcffadcec04a',
clientId: '44be3f69-df2f-44d7-9ccc-99f888098369',
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

