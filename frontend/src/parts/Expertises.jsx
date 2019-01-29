import React from 'react';
import styled from 'styled-components';
import { Link } from 'react-router-dom';

import { Row, Col } from 'Components/Layout';
import { StyledSection, StyledHeader } from 'Components/Sections';

import dataMining from 'Images/tech/data-mining.png';
import programming from 'Images/tech/programming.svg';
import cloud from 'Images/tech/cloud-computing.svg'; // https://www.svgrepo.com/svg/278286/cloud-computing-share

const ExpertiseCol = styled(Col)`
  text-align: center;

  &:not(:last-child) {
    border-right: solid white 1px;
  }

  a {
    color: ${({theme}) => theme.secondaryColor};
    text-decoration: none;
  }

  h5 {
    color: ${({theme}) => theme.primaryColor};
    font-size: 1.3em;
    span {
      border-bottom: solid transparent 3px;
      &:hover {
        border-bottom-color: ${({theme}) => theme.primaryColor};
      }
    }
  }

  img {
    width: 10em;
  }

  p {
    color: ${({theme}) => theme.textColor};
  }
`;

export default function Expertises(props) {
  return <StyledSection id="section-expertises">
    <Row>
      <ExpertiseCol sm={12}>
        <StyledHeader>
          My areas of expertise
        </StyledHeader>
      </ExpertiseCol>
    </Row>
    <Row>
      <ExpertiseCol sm={4}>
        <Link to='/'>
          <img src={dataMining} alt='Funnel' />
          <h5><span>Data Science</span></h5>
        </Link>
        <p>
          This field is all about extracting data from different sources,
          adapting them to convenient formats and transforming them
          into answers to relevant questions for your application.
        </p>
        <p>
          Know more about it <Link to='/'>here</Link>
        </p>
      </ExpertiseCol>
      <ExpertiseCol sm={4}>
        <Link to='/'>
          <img src={programming} alt='Computer' />
          <h5><span>Full Stack Development</span></h5>
        </Link>
        <p>
          Developing web-based applications from the design implementation to the
          creation of responsive interfaces, serving them through secure and modern
          backend technologies.
        </p>
        <p>
          Find more about it <Link to='/'>here</Link>
        </p>
      </ExpertiseCol>
      <ExpertiseCol sm={4}>
        <Link to='/'>
          <img src={cloud} alt='Cloud' />
          <h5><span>Cloud Infrastructure Management</span></h5>
        </Link>
        <p>
          Planning and managing the infrastructure necessary for fast-loading,
          highly accessible and consumer-friendly web applications in cloud services.
        </p>
        <p>
          Learn more about it <Link to='/'>here</Link>
        </p>
      </ExpertiseCol>
    </Row>
  </StyledSection>
};
