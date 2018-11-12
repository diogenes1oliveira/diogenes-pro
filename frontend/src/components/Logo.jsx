import React from 'react';
import { Link } from 'react-router-dom';
import styled from 'styled-components';

import logoSrc from 'Images/logo.png';

export const LogoIcon = styled.img`
  display: inline-block;
  height: 1.2em;
  vertical-align: middle;
`;

export const LogoName = styled.span`
  font-weight: bold;
  color: white;
  display: inline-block;
  vertical-align: middle;
`;

export default styled(
  props => <Link {...props} to={'/'}>
    <LogoIcon src={logoSrc} alt='diógenes' title='Diógenes Oliveira' />
  </Link>
)`
  font-size: 30px;
  margin: 5px;
`;
