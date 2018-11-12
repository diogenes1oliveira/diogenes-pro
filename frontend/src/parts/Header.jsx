import React from 'react';
import styled from 'styled-components';

import Logo from 'Components/Logo';
import NavBar from 'Components/NavBar';

const StyledHeader = styled.header`
  background-color: ${({theme}) => theme.overlayColor};
  font: 16px monospace;

  ${Logo} {
    float: left;
    width: 50%;
  }

  ${NavBar} {
  }

  &:after {
    clear: both;
    content: "";
    display: table;
  }

`;

export default function Header(props) {
  return <StyledHeader>
    <Logo />
    <NavBar />
  </StyledHeader>;
}
