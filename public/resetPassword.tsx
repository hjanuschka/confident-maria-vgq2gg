import resetPassword from '../styles/resetPassword.module.scss';
import { Button, Col, Form, Input, Row } from 'antd';
import { UserOutlined } from '@ant-design/icons';
import ProductDescription from '../component/shared/registration-description/productDescription';

const ResetPassword = () => {
	const [form] = Form.useForm();

	const onFinish = () => {
	};
	return (
		<Row className={resetPassword.reset}>
			<Col md={12} lg={12} xl={12} xs={24} sm={24} className={resetPassword.description}>
				<ProductDescription />
			</Col>
			<Col md={12} lg={12} xl={12} xs={24} sm={24} className={resetPassword.form}>
				<Row justify="center" align="middle">
					<Col span={11}>
						<Col>
							<p className={resetPassword.loginHeading}>Reset your Password</p>
							<p className={resetPassword.loginAccount}>We'll email you instructions to reset your password</p>
						</Col>
						<br />
						<Form
							form={form}
							layout="vertical"
							name="normal_login"
							className={resetPassword.loginForm}
							initialValues={{
								requiredMarkValue: false,
							}}
							onFinish={onFinish}
						>
							<Form.Item
								label="Business Email Address (Username)"
								name="username"
								rules={[
									{
										message: 'Please input your Username!',
									},
								]}
							>
								<Input prefix={<UserOutlined className="site-form-item-icon" />} placeholder="Username" />
							</Form.Item>
							<Form.Item>
								<Row justify="center" align="middle">
									<Col span={24}>
										<Button type="primary" size="large" shape="round" htmlType="submit" className={resetPassword.loginFormButton + " " + resetPassword.loginButton}>
											RESET PASSWORD
										</Button>
									</Col>
								</Row>
								<Row justify="center" align="middle">
									<Col className={resetPassword.createAccount}>
										Return to Login
									</Col>
								</Row>
							</Form.Item>
						</Form>
					</Col>
				</Row>
			</Col >
		</Row >
	);
};

export default ResetPassword;
