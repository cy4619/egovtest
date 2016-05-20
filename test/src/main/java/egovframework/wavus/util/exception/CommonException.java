package egovframework.wavus.util.exception;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class CommonException  extends Exception {
	private static final Logger LOGGER = LoggerFactory.getLogger(CommonException.class);
	/**
	 * 
	 */
	private static final long serialVersionUID = 7144851136930016594L;
	public CommonException()

	{

	}

	public CommonException(String message)

	{

		super(message);

	}

	public CommonException(Throwable cause)

	{

		super(cause);

	}

	public CommonException(String message, Throwable cause)

	{
		super(message, cause);
		LOGGER.debug("SmppCmmException {}",cause.getMessage());

	}

	public CommonException(String message, Throwable cause,

	boolean enableSuppression, boolean writableStackTrace)

	{

		super(message, cause, enableSuppression, writableStackTrace);

	}
}