import React, { useState } from "react";
import * as s from "../../styles/pages/contactus.style";
import { Container, Row, Col, Form } from "react-bootstrap";
import ReCAPTCHA from "react-google-recaptcha";
import apiRouter from "../../utils/apiRouter";
import { axiosPost } from "../../utils/axiosMethod";
import { useForm } from "react-hook-form";
import LoaderComponent from "../../components/LoaderComponent";
import toaster from "../../utils/toaster";
import SeoComponent from "../../components/SeoComponent";

const ContactUs = () => {
  // const
  const { register, handleSubmit, watch, errors, reset } = useForm();
  const recaptchaRef = React.createRef();

  // state
  const [isLoading, setIsLoading] = useState(false);
  const [isCaptch, setIsCaptch] = useState(false);

  // Method
  const handleChangeCaptcha = (value) => {
    console.log("Captcha value:", value);
    // this.setState({ value });
    // if value is null recaptcha expired
    setIsCaptch(value || false);
  };
  const handleFormSubmit = async (val) => {
    const { fname, lname, email, phone, message } = val;
    const insertData = {
      fname,
      lname,
      email,
      phone,
      message,
    };

    if (!isCaptch) {
      return toaster("error", "Please Verify your Captcha");
    }

    try {
      setIsLoading(true);
      const result = await axiosPost(apiRouter.CONTACT, insertData);
      if (result.status) {
        reset();
        toaster("success", "Message Send Successfully");
      } else {
        toaster("error", result?.message);
      }
    } catch (error) {
      console.log("Error ::", error);
    } finally {
      setIsLoading(false);
    }
  };

  return (
    <>
      <SeoComponent
        metaDetail={{
          title: `Evenimex`,
          desc: "Evenimex",
        }}
      />
      <s.ContactMain>
        <Container>
          <Row>
            <Col md={12}>
              <s.FormMain>
                <s.PageTitle>Trimiteti-ne un mesaj</s.PageTitle>
                <s.ContactFormMain>
                  <Form onSubmit={handleSubmit(handleFormSubmit)}>
                    <s.FieldCombine>
                      <Form.Group className="mb-3">
                        <Form.Label>Nume</Form.Label>
                        <Form.Control
                          type="text"
                          placeholder="Nume"
                          name="fname"
                          ref={register({
                            required: true,
                          })}
                        />
                      </Form.Group>
                      <Form.Group className="mb-3">
                        <Form.Label>Prenume</Form.Label>
                        <Form.Control
                          type="text"
                          placeholder="Prenume"
                          name="lname"
                          ref={register({
                            required: true,
                          })}
                        />
                      </Form.Group>
                    </s.FieldCombine>
                    <s.FieldCombine>
                      <Form.Group className="mb-3" controlId="formBasicEmail">
                        <Form.Label>E-mail</Form.Label>
                        <Form.Control
                          type="email"
                          placeholder="E-mail"
                          name="email"
                          ref={register({
                            required: "email is required",
                          })}
                        />
                        {errors?.email && (
                          <p className="m-t text-danger">
                            {errors?.email?.message}
                          </p>
                        )}
                      </Form.Group>
                      <Form.Group
                        className="mb-3"
                        controlId="formBasicPassword"
                      >
                        <Form.Label>Telefon</Form.Label>
                        <Form.Control
                          type="number"
                          placeholder="Telefon"
                          name="phone"
                          ref={register({
                            required: "plase add your number",
                          })}
                        />
                        {errors?.phone && (
                          <p className="m-t text-danger">
                            {errors?.phone?.message}
                          </p>
                        )}
                      </Form.Group>
                    </s.FieldCombine>
                    <s.FieldCombine isMsg>
                      <Form.Group
                        className="mb-3"
                        controlId="formBasicPassword"
                      >
                        <Form.Label>Mesaj</Form.Label>
                        <Form.Control
                          type="text"
                          placeholder="Mesaj"
                          name="message"
                          ref={register({
                            required: "Mesaj is required",
                          })}
                        />
                        {errors?.message && (
                          <p className="m-t text-danger">
                            {errors?.message?.message}
                          </p>
                        )}
                      </Form.Group>
                    </s.FieldCombine>
                    <s.FieldCombine isMsg>
                      <ReCAPTCHA
                        sitekey={Buffer.from(""+localStorage.getItem('rsk'), 'base64').toString()}
                        ref={recaptchaRef}
                        onChange={handleChangeCaptcha}
                      />
                    </s.FieldCombine>
                    <s.BottomBlock>
                      <s.ButtonMain>
                        <s.LoginButton>Trimite</s.LoginButton>
                      </s.ButtonMain>
                    </s.BottomBlock>
                  </Form>
                  {/* {errorMsg && <div>{errorMsg}</div>} */}
                </s.ContactFormMain>
              </s.FormMain>
            </Col>
          </Row>
        </Container>
        <LoaderComponent isLoading={isLoading} />
      </s.ContactMain>
    </>
  );
};

export default ContactUs;
