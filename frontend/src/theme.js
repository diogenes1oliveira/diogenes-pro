import { createGlobalStyle } from 'styled-components';

import flumeBackground from './images/bg/flumes-in-switzerland-blurred.jpg';

const theme = {
  bgColor: "#05060b",
  bgImage: flumeBackground,
  primaryColor: "#102234",
  secondaryColor: "#A7793C",
  overlayColor: "rgba(0, 0, 0, 0.5)",
};

export const BodyStyler = createGlobalStyle`
  body {
    background-color: ${theme.bgColor};
    background-image: url(${theme.bgImage});
    background-repeat: no-repeat;
    background-attachment: fixed;
    background-position: center center;
    background-size: cover;
  }
`;

export default theme;
