import React from 'react';
import styled from 'styled-components';

import { Row, Col } from 'Components/Layout';
import { StyledSection, StyledHeader } from 'Components/Sections';
import { SmallCard } from 'Components/Cards';

import dataMining from 'Images/tech/data-mining.png';


export default function Projects(props) {
  return <StyledSection id="section-projects">
    <Row>
      <Col sm={12}>
        <StyledHeader>
          My projects
        </StyledHeader>
      </Col>
    </Row>
    <Row>
      <Col sm={6}>
        <SmallCard linkTo='/' title='PreBubble' imgSrc={dataMining}>
          <p>
            Preemptively block trolls and annoying accounts from even
            appearing in your feed
          </p>
        </SmallCard>
      </Col>
      <Col sm={6}>
        <SmallCard linkTo='/' title='SubAI' imgSrc={dataMining}>
          <p>
            Using speech recognition + AI to automatically resync
            subtitles to video.
          </p>
        </SmallCard>
      </Col>
      <Col sm={6}>
        <SmallCard linkTo='/' title='GUInotify' imgSrc={dataMining}>
          <p>
            Visually
          </p>
        </SmallCard>
      </Col>
      <Col sm={6}>
        <SmallCard linkTo='/' title='PreBubble' imgSrc={dataMining}>
          <p>
            Preemptively block trolls and annoying accounts from even
            appearing in your feed
          </p>
        </SmallCard>
      </Col>
      <Col sm={6}>
        <SmallCard linkTo='/' title='PreBubble' imgSrc={dataMining}>
          <p>
            Preemptively block trolls and annoying accounts from even
            appearing in your feed
          </p>
        </SmallCard>
      </Col>
    </Row>
  </StyledSection>;
}