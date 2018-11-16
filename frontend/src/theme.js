import { createGlobalStyle } from 'styled-components';

import flumeBackground from './images/bg/flumes-in-switzerland-blurred.jpg';

const theme = {
  bgColor: "#05060b",
  bgImage: flumeBackground,
  baseFont: 'monospace',
  innerSpacing: '20px',
  overlayColor: "rgba(0, 0, 0, 0.5)",
  primaryColor: "#fe6900",
  secondaryColor: "#A7793C",
  spacing: '20px',
  textColor: 'white',
  underlineSize: '3px',
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
