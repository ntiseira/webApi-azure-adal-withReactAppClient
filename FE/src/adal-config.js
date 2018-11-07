import { AuthenticationContext, adalFetch, withAdalLogin } from 'react-adal';
  
export const adalConfig = {
  tenant: 'aaaaaaaa-c220-48a2-a73f-1177fa2c098e',
  clientId: 'aaaaaaa-bd54-456d-8aa7-f8cab3147fd2',
  endpoints: {
    api:'aaaaaaaa-abaa-4519-82cf-e9d022b87536'
  },
  'apiUrl': 'https://ourfuturewebappi-app.azurewebsites.net/api',
  cacheLocation: 'localStorage'
};
  
export const authContext = new AuthenticationContext(adalConfig);
  
export const adalApiFetch = (fetch, url, options) =>
  adalFetch(authContext, adalConfig.endpoints.api, fetch, adalConfig.apiUrl+url, options);
  
export const withAdalLoginApi = withAdalLogin(authContext, adalConfig.endpoints.api);​