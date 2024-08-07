// import React from "react";
// import dynamic from "next/dynamic";
// const OwlCarousel = dynamic(() => import("react-owl-carousel"), {
//   ssr: false,
// });
// const $ = require("jquery");
// if (typeof window !== "undefined") {
//   window.$ = window.jQuery = require("jquery");
// }
// import "owl.carousel/dist/assets/owl.carousel.css";
// import "owl.carousel";
// $(".owl-carousel").owlCarousel({
//   loop: true,
//   autoplaySpeed: 500,
//   dots: false,
//   margin: 30,
//   nav: true,
//   navText: [
//     "<img class='color-back' src='/images/left-carousel.png'>",
//     "<img class='color-back' src='/images/right-carousel.png'>",
//   ],
//   autoplay: true,
//   responsive: {
//     0: {
//       items: 1,
//     },
//     600: {
//       items: 2,
//     },
//     1000: {
//       items: 3,
//     },
//   },
// });
// {
//   <div>
//     <section id='carousel-section'>
//       <div className='container'>
//         <div>
//           <h1 className='text-center our-values-title'>Our Values</h1>
//           <h4 className='pride'>We pride ourselves on the following values:</h4>
//         </div>
//         <div className='row'>
//           <div className='col-12 m-auto'>
//             <div className='owl-carousel owl-theme'>
//               <div className='item'>
//                 <div className='card'>
//                   <Image
//                     className='d-block w-100'
//                     alt='First slide'
//                     src='/images/card-innovation.svg'
//                     width={50}
//                     height={20}
//                   ></Image>
//                   <div className='card-body'>
//                     <h3 className='card-title'>Transparent</h3>
//                     <p className='card-text'>
//                       From the initial sourcing of candidates for your business
//                       or finding jobs that align with your requirements, we
//                       regularly update you on our progress.
//                     </p>
//                   </div>
//                 </div>
//               </div>
//               <div className='item'>
//                 <div className='card'>
//                   <Image
//                     className='d-block w-100'
//                     alt=' Second slide'
//                     src='/images/card-trust.svg'
//                     width={250}
//                     height={200}
//                   ></Image>
//                   <div className='card-body'>
//                     <h3 className='card-title'>Sincere</h3>
//                     <p className='card-text'>
//                       Everything we do revolves around our empathy for our
//                       candidates, clients, and staff. Through consistent
//                       communication, we always maintain the utmost respect.
//                     </p>
//                   </div>
//                 </div>
//               </div>
//               <div className='item'>
//                 <div className='card'>
//                   <Image
//                     className='d-block w-100'
//                     alt='Third slide'
//                     src='/images/card-support.svg'
//                     width={250}
//                     height={200}
//                   ></Image>
//                   <div className='card-body'>
//                     <h3 className='card-title'>Innovative</h3>
//                     <p className='card-text'>
//                       We're always staying on top of the latest industry trends
//                       by undergoing training and fine tuning our operations,
//                       systems, and recruitment strategies, to ensure you reap
//                       results in your career or business.
//                     </p>
//                   </div>
//                 </div>
//               </div>
//               <div className='item'>
//                 <div className='card'>
//                   <Image
//                     className='d-block w-100'
//                     alt='Fourth slide'
//                     src='/images/card-diversity.svg'
//                     width={250}
//                     height={200}
//                   ></Image>
//                   <div className='card-body'>
//                     <h3 className='card-title'>Inclusive</h3>
//                     <p className='card-text'>
//                       Regarding job applications and recruitment, we treat you
//                       as a human first, never discriminating based on your
//                       background or experience.
//                     </p>
//                   </div>
//                 </div>
//               </div>
//               <div className='item'>
//                 <div className='card'>
//                   <Image
//                     className='d-block w-100'
//                     alt=' Fifth slide'
//                     src='/images/card-integrity.svg'
//                     width={250}
//                     height={200}
//                   ></Image>
//                   <div className='card-body'>
//                     <h3 className='card-title'>Driven</h3>
//                     <p className='card-text'>
//                       We never settle for average; we're always seeking ways to
//                       raise the standards of staffing solutions and provide
//                       training for entry level positions.
//                     </p>
//                   </div>
//                 </div>
//               </div>
//               <div className='item'>
//                 <div className='card'>
//                   <Image
//                     className='d-block w-100'
//                     alt=' Sixth slide'
//                     src='/images/card-impact.svg'
//                     width={250}
//                     height={200}
//                   ></Image>
//                   <div className='card-body'>
//                     <h3 className='card-title'>Supportive</h3>
//                     <p className='card-text'>
//                       We're available and accessible to all via emails or phone
//                       calls. Whether you have an inquiry or application, or
//                       searching for a candidate or position, we always support
//                       your decision.
//                     </p>
//                   </div>
//                 </div>
//               </div>
//             </div>
//           </div>
//         </div>
//       </div>
//     </section>
//   </div>;
// }
import Head from "next/head";

import Footer from "../components/Footer/Footer";
import { useState, useEffect } from "react";

export default function Home({}) {
  const [modal, setModal] = useState(false);
  useEffect(() => {
    window.navigator.geolocation.getCurrentPosition(
      (newPos) => setPosition(newPos),
      console.error
    );
  }, []);
  return (
    <div>
      <Head>
        <title>Slidder</title>
      </Head>

      <div>
        <section class='Job'>
          <div class='container'>
            <div class='row'>
              <div class='col-lg-6 col-md-12 col-12'>
                <div class='card col-12 candidate-card'>
                  <div class='row g-1'>
                    <div class='col-md-8 col-12'>
                      <div class='card-body Job-Seeker'>
                        <h5 class='card-title'>Looking for employment?</h5>
                        <p class='card-text'>
                          In order to be connected to career opportunities in
                          state, national and remote positions, we need to learn
                          about you first. Our recruiters review your resume to
                          understand your skillset, qualifications, and
                          experience before suggesting suitable positions. If we
                          find you meet our talent expectations, we’ll invite
                          you for an interview to learn more and assist with
                          your work search.
                        </p>
                        <button
                          onClick={() => setModal(true)}
                          id='myBtn'
                          class='btn btn-outline-success sub-btn'
                        >
                          Submit your Resume
                        </button>
                      </div>
                    </div>
                    <div class='col-md-4 col-12 icon'>
                      <img
                        src='./assets/images/JobSeeker green.png'
                        class='img-fluid rounded-start'
                        alt='JobSeeker'
                      />
                    </div>
                  </div>
                </div>
              </div>
              <div class='col-lg-6 col-md-12'>
                <div class='card col-12 candidate-card'>
                  <div class='row g-1'>
                    <div class='col-md-8'>
                      <div class='card-body Job-Seeker'>
                        <h5 class='card-title'>Connect with candidates</h5>
                        <p class='card-text'>
                          With over 60 years of experience combined in
                          recruitment and tech, we know what to look for when
                          hiring. At Impact Careers, we have an extensive and
                          experienced database of skilled talent suited to help
                          build teams and organizations. All of these have
                          undergone thorough screenings, background checks, and
                          interviews to ensure they can face challenges and fit
                          into your business culture.
                        </p>
                        <button
                          id='myBtn1'
                          class='btn btn-outline-success sub-btn'
                        >
                          Search for candidates
                        </button>
                      </div>
                    </div>
                    <div class='col-md-4 col-12 icon'>
                      <img
                        src='./assets/images/EmployerSeekingCandidatesGradient.png'
                        class='img-fluid rounded-start'
                        alt='employeeseeker'
                      />
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class='row mt-4'>
              <div class='col-lg-6 col-md-12'>
                <div class='card col-12 Learn'>
                  <div class='row g-1'>
                    <div class='col-md-7 col-12'>
                      <div class='card-body p-0'>
                        <h5 class='card-title text-white'>
                          Resources to raise your chances
                        </h5>
                        <p class='text-white'>
                          Upskill yourself and gain a greater advantage for
                          future job applications. Our specific training
                          resources can help you learn more and provide you with
                          higher chances of landing roles.
                        </p>
                        <button
                          id='myBtn2'
                          class='btn btn-outline-white access-btn'
                        >
                          Request access
                        </button>
                      </div>
                    </div>
                    <div class='col-sm-12 col-md-5 icon learnIcon'>
                      <img
                        src='./assets/images/learn.png'
                        class='img-fluid rounded-start'
                        alt='learn'
                      />
                    </div>
                  </div>
                </div>
              </div>
              <div class='col-lg-6 col-md-12'>
                <div class='card col-12 last-card'>
                  <div class='row g-1'>
                    <div class='col-md-12'>
                      <div class='card-body sign-up'>
                        <h5 class='card-title text-white'>
                          Be the first to know
                        </h5>
                        <p class='card-text text-white'>
                          Gain updates first on incoming job roles that become
                          available to us. Receive unique tips and tricks to
                          assist with your search.
                        </p>
                        <div class='email'>
                          <div class='form-group'>
                            <input
                              type='email'
                              class='text-field'
                              maxlength='256'
                              name='email'
                              data-name='Email'
                              placeholder='Your email address......'
                            />
                          </div>
                        </div>
                        <div class='form-group'>
                          <a
                            href='#'
                            class='btn btn-outline-success signup-btn'
                          >
                            Subscribe
                          </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
        <div
          id='myModal'
          class='modal'
          style={{ display: modal ? "block" : "none" }}
        >
          <div class='modal-content'>
            <span class='close' onClick={() => setModal(false)}>
              &times;
            </span>
            <section id='contact-form'>
              <div class='container'>
                <div class='get-in-touch'>
                  <h2>Apply for this Job</h2>
                  <p>
                    Please fill the details below to evaluate your candidature
                  </p>
                </div>
                <form class='needs-validation' method='post'>
                  <div class='row'>
                    <div class='col-sm-6'>
                      <input
                        type='text'
                        class='form-control'
                        id='firstName'
                        placeholder='First Name'
                        value=''
                        required
                      />
                      <div class='invalid-feedback'>
                        Valid first name is required.
                      </div>
                    </div>
                    <div class='col-sm-6'>
                      <input
                        type='text'
                        class='form-control'
                        id='lastName'
                        placeholder='Last Name'
                        value=''
                        required
                      />
                      <div class='invalid-feedback'>
                        Valid last name is required.
                      </div>
                    </div>
                  </div>
                  <div class='row'>
                    <div class='col-sm-6'>
                      <input
                        type='email'
                        class='form-control'
                        id='email'
                        placeholder='Email'
                        value=''
                        required
                      />
                      <div class='invalid-feedback'>
                        Valid email address is required.
                      </div>
                    </div>
                    <div class='col-sm-6'>
                      <input
                        type='tel'
                        class='form-control'
                        id='Phone'
                        placeholder='Mobile number'
                        value=''
                        required
                      />
                      <div class='invalid-feedback'>
                        Valid phone number is required.
                      </div>
                    </div>
                  </div>
                  <div class='row'>
                    <div class='col-sm-6'>
                      <input
                        type='text'
                        class='form-control'
                        id='Position Location'
                        placeholder='Your Location'
                        value=''
                        required
                      />
                      <div class='invalid-feedback'>
                        Please enter position location .
                      </div>
                    </div>
                    <div class='col-sm-6'>
                      <input
                        type='text'
                        class='form-control'
                        id='Title of Position'
                        placeholder='Title of Position'
                        value=''
                        required
                      />
                      <div class='invalid-feedback'>
                        Please enter Title of Position.
                      </div>
                    </div>
                  </div>
                  <div class='row'>
                    <div class='col-sm-6'>
                      <div>
                        <input
                          type='text'
                          class='form-control'
                          id='Title of Position'
                          placeholder='Notice period'
                          value=''
                          required
                        />
                      </div>
                    </div>
                    <div class='col-sm-6'>
                      <div class='form-group'>
                        <input
                          type='text'
                          class='form-control'
                          id='Title of Position'
                          placeholder='Linked in URL'
                          value=''
                          required
                        />
                      </div>
                    </div>
                  </div>
                  <div class='row'>
                    <div class='col-sm-12'>
                      <div>
                        <input
                          type='file'
                          class='w-file-upload-input form-control'
                          accept='.pdf, .doc, .docx, .txt'
                          name='Resume-Upload'
                          data-iconName='fa-solid fa-cloud-arrow-up'
                          data-name='Upload Job Description, If Available'
                          aria-hidden='true'
                          id='Resume-Upload'
                          aria-placeholder=' Upload Job Description, If Available'
                          tabindex='-1'
                          required=''
                        />
                        <p class='text-center'>
                          Accepted formats : PDF, DOC, DOCX, TXT (Max file size
                          10MB)
                        </p>
                      </div>
                    </div>
                  </div>
                  <div class='form-group text-center'>
                    <input
                      type='submit'
                      value='Submit'
                      data-wait='Please wait...'
                      class='site-btn'
                    />
                  </div>
                </form>
              </div>
            </section>
          </div>
        </div>
      </div>
      <Footer />
    </div>
  );
}
// var modal = document.getElementById("myModal");
// var btn = document.getElementById("myBtn");
// var span = document.getElementsByClassName("close")[0];
// btn.onclick = function () {
//   modal.style.display = "block";
// };
// span.onclick = function () {
//   modal.style.display = "none";
// };
// window.onclick = function (event) {
//   if (event.target == modal) {
//     modal.style.display = "none";
//   }
// };
// var modal = document.getElementById("myModal");
// var btn = document.getElementById("myBtn1");
// var span = document.getElementsByClassName("close")[0];
// btn.onclick = function () {
//   modal.style.display = "block";
// };
// span.onclick = function () {
//   modal.style.display = "none";
// };
// window.onclick = function (event) {
//   if (event.target == modal) {
//     modal.style.display = "none";
//   }
// };
// var modal = document.getElementById("myModal");
// var btn = document.getElementById("myBtn2");
// var span = document.getElementsByClassName("close")[0];
// btn.onclick = function () {
//   modal.style.display = "block";
// };
// span.onclick = function () {
//   modal.style.display = "none";
// };
// window.onclick = function (event) {
//   if (event.target == modal) {
//     modal.style.display = "none";
//   }
// };
